import "../../../../slices/main/assets/builds/app.css";
import "../css/app.css";

(function() {
    document.addEventListener('alpine:init', () => {
        Alpine.magic('clipboard', () => {
            return subject => navigator.clipboard.writeText(subject)
        })
    })
})();