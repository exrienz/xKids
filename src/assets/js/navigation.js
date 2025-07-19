function initializeKeyboardNavigation() {
    const levelButtons = document.querySelectorAll('.level-button');
    let currentFocusIndex = 0;
    
    if (levelButtons.length > 0) {
        levelButtons[0].setAttribute('tabindex', '0');
        levelButtons.forEach((button, index) => {
            if (index > 0) button.setAttribute('tabindex', '-1');
        });
    }
    
    document.addEventListener('keydown', function(e) {
        const focusableElements = Array.from(document.querySelectorAll('.level-button'));
        
        switch(e.key) {
            case 'ArrowRight':
            case 'ArrowDown':
                e.preventDefault();
                currentFocusIndex = (currentFocusIndex + 1) % focusableElements.length;
                updateFocus();
                break;
            case 'ArrowLeft':
            case 'ArrowUp':
                e.preventDefault();
                currentFocusIndex = (currentFocusIndex - 1 + focusableElements.length) % focusableElements.length;
                updateFocus();
                break;
            case 'Enter':
            case ' ':
                e.preventDefault();
                if (focusableElements[currentFocusIndex]) {
                    focusableElements[currentFocusIndex].click();
                }
                break;
        }
    });
    
    function updateFocus() {
        levelButtons.forEach((button, index) => {
            if (index === currentFocusIndex) {
                button.setAttribute('tabindex', '0');
                button.focus();
            } else {
                button.setAttribute('tabindex', '-1');
            }
        });
    }
}