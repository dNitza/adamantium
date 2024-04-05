import "../../../../slices/main/assets/builds/app.css";
import "../css/app.css";

(function() {
    document.addEventListener('alpine:init', () => {
        Alpine.magic('clipboard', () => {
            return subject => navigator.clipboard.writeText(subject)
        })

        Alpine.magic('textHighlighter', (el, {Alpine}) => {
            return {
                isOpen: false,
                anchorX: "0px",
                anchorY: "0px",
                selection: null,
                text: "",
                highlightText() {
                    this.isOpen = false
                    // document.
                    this.selection = document.getSelection()
                    this.text = this.selection.toString()
                    const anchor = this.selection.focusNode.parentElement.getBoundingClientRect()
                    this.isOpen = el.contains(this.selection.focusNode) && this.selection.focusOffset != this.selection.anchorOffset;

                    this.anchorX = `${anchor.left - 170}px`
                    this.anchorY = `${anchor.top + window.scrollY}px`
                }
            }
        })
    })
})();