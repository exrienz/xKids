function initializeAnimations() {
    const cards = document.querySelectorAll('.fade-in');
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.animationPlayState = 'running';
            }
        });
    }, {
        threshold: 0.1
    });
    
    cards.forEach(card => {
        observer.observe(card);
    });
}

function initializePageAnimations() {
    document.addEventListener('DOMContentLoaded', function() {
        initializeAnimations();
        initializeKeyboardNavigation();
        initializeAudioEffects();
    });
}