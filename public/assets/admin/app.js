(() => {
  // slices/admin/assets/js/app.js
  (function() {
    document.addEventListener("alpine:init", () => {
      Alpine.magic("clipboard", () => {
        return (subject) => navigator.clipboard.writeText(subject);
      });
    });
  })();
})();
