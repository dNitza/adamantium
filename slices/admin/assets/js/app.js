import "../../../../app/assets/builds/app.css";
import "../css/app.css";

import TinyMDE from "tiny-markdown-editor";
import defo from "@icelab/defo";

(function() {
    document.addEventListener('alpine:init', () => {
        Alpine.magic('clipboard', () => {
            return subject => navigator.clipboard.writeText(subject)
        })
    })

    document.addEventListener("DOMContentLoaded", function () {
        const views = {
            markdown: (el, attrs) => {

                var tinyMDE = new TinyMDE.Editor({textarea: attrs.editorId});

                return {
                    update: (newName, oldName) => {},
                    destroy: () => {}
                };
            }
        };

        defo({views});
    });
})();