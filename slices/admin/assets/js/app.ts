// import "../../../../slices/main/assets/builds/app.css";
import "@main/css/app.css";
import "@app/builds/tailwind.css";
import "../css/app.css";

import { Crepe } from "@milkdown/crepe";
import { listener, listenerCtx } from "@milkdown/kit/plugin/listener";

async function uploadImage(file: File) {
  const formData = new FormData();
  formData.append("file", file); // Append the file to the FormData object

  try {
    const response = await fetch("/micropub/media", {
      method: "POST",
      body: formData,
    });

    if (response.ok) {
      const jsonResponse = await response.json();
      return jsonResponse["url"];
    } else {
      alert("File upload failed.");
    }
  } catch (error) {
    console.error("Error:", error);
    alert("An error occurred during the upload.");
    return null;
  }
}

(function () {
  document.addEventListener("alpine:init", () => {
    Alpine.magic("clipboard", () => {
      return (subject) => navigator.clipboard.writeText(subject);
    });

    Alpine.magic("textHighlighter", (el, { Alpine }) => {
      return {
        isOpen: false,
        anchorX: "0px",
        anchorY: "0px",
        selection: null,
        text: "",
        highlightText() {
          this.isOpen = false;
          // document.
          this.selection = document.getSelection();
          this.text = this.selection.toString();
          const anchor =
            this.selection.focusNode.parentElement.getBoundingClientRect();
          this.isOpen =
            el.contains(this.selection.focusNode) &&
            this.selection.focusOffset != this.selection.anchorOffset;

          this.anchorX = `${anchor.left - 170}px`;
          this.anchorY = `${anchor.top + window.scrollY}px`;
        },
      };
    });

    let editor = document.getElementById("editor");

    const crepe = new Crepe({
      root: editor,
      defaultValue: editor.dataset.postText,
      featureConfigs: {
        [Crepe.Feature.ImageBlock]: {
          onUpload: async (file: File) => {
            return uploadImage(file);
          },
        },
      },
    });

    crepe.editor.config((ctx) => {
      const bodyText = document.getElementById("body");
      bodyText.hidden = true;
      ctx.get(listenerCtx).markdownUpdated((ctx, markdown, prevMarkdown) => {
        bodyText.innerHTML = markdown;
      });
    });

    crepe.editor.use(listener);

    crepe.create();
  });
})();
