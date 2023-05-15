(function() {
    document.addEventListener('alpine:init', () => {
        Alpine.magic('clipboard', () => {
            return subject => navigator.clipboard.writeText(subject)
        })
    })
    document.addEventListener("DOMContentLoaded", function () {
        const times = document.querySelectorAll('time');
        times.forEach((time) => {
        const oldDtime = Date.parse(time.dateTime);
        time.innerHTML = new Date(oldDtime).toLocaleDateString(navigator.language, { weekday:"long", year:"numeric", month:"short", day:"numeric"});

        md_gallery({
            "class_name": "grid gap-4 grid-cols-2 prose-img:m-0"
        });
    });
    // mapboxgl.accessToken = 'pk.eyJ1IjoiZG5pdHphIiwiYSI6ImNsZWIyY3ZzaTE0cjUzdm4xdnZ6czRlYjUifQ.FRETOXYRID6T2IoB7qqRLg';
    // var map = new mapboxgl.Map({
    //   container: 'map',
    //   style: 'mapbox://styles/mapbox/streets-v11'
    // });
    // const mapContainer = document.getElementById("map");
    // const markers = JSON.parse(mapContainer.dataset["markers"]);
    // for (var i = 0; i < markers.length; i++) {
    //     const marker = markers[i];
    //     new mapboxgl.Marker()
    //         .setLngLat(marker)
    //         .addTo(map);
    // }
    });
})();
