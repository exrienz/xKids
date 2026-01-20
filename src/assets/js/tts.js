(function () {
    const languageFallbacks = {
        'ms-MY': ['ms-MY', 'ms', 'id-ID', 'id'],
        'ar-SA': ['ar-SA', 'ar', 'ar-EG', 'ar-MA']
    };

    function getVoiceForLanguage(lang) {
        if (!('speechSynthesis' in window)) {
            return null;
        }

        const voices = window.speechSynthesis.getVoices();
        if (!voices.length) {
            return null;
        }

        const preferred = languageFallbacks[lang] || [lang];
        for (const preference of preferred) {
            const match = voices.find((voice) =>
                voice.lang && voice.lang.toLowerCase().startsWith(preference.toLowerCase())
            );
            if (match) {
                return match;
            }
        }

        return voices.find((voice) => voice.default) || voices[0];
    }

    function playTtsAudio(text, lang) {
        if (!('speechSynthesis' in window)) {
            return false;
        }

        if (!text) {
            return false;
        }

        const utterance = new SpeechSynthesisUtterance(text);
        utterance.lang = lang || 'ms-MY';
        const selectedVoice = getVoiceForLanguage(utterance.lang);
        if (selectedVoice) {
            utterance.voice = selectedVoice;
        }
        utterance.rate = 0.9;
        utterance.pitch = 1;

        try {
            window.speechSynthesis.cancel();
            window.speechSynthesis.speak(utterance);
            return true;
        } catch (error) {
            return false;
        }
    }

    function warmUpVoices() {
        if (!('speechSynthesis' in window)) {
            return;
        }

        getVoiceForLanguage('ms-MY');
        getVoiceForLanguage('ar-SA');
    }

    if ('speechSynthesis' in window) {
        window.speechSynthesis.onvoiceschanged = warmUpVoices;
        warmUpVoices();
    }

    window.playTtsAudio = playTtsAudio;
})();
