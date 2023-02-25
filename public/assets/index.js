(function() {
  document.addEventListener("DOMContentLoaded", function () {
    const times = document.querySelectorAll('time');
    times.forEach((time) => {
     const oldDtime = Date.parse(time.dateTime);
     time.innerHTML = new Date(oldDtime).toLocaleDateString(navigator.language, { weekday:"long", year:"numeric", month:"short", day:"numeric"});
    });
  });
})();
