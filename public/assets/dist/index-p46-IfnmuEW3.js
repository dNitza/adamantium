(function() {
    document.addEventListener('alpine:init', () => {
        Alpine.magic('clipboard', () => {
            return subject => navigator.clipboard.writeText(subject)
        })
    })
    document.addEventListener("DOMContentLoaded", function () {
        if (window.hljs !== undefined) {
            window.hljs.highlightAll();
        }

        const times = document.querySelectorAll('time');
        times.forEach((time) => {
            const oldDtime = Date.parse(time.dateTime);
            time.innerHTML = new Date(oldDtime).toLocaleDateString(navigator.language, { weekday:"long", year:"numeric", month:"short", day:"numeric"});

            md_gallery({
                "class_name": "grid gap-4 grid-cols-2 prose-img:m-0"
            });

            const mediaForm = document.getElementById("media_form");
            if (mediaForm !== null) {
                htmx.on('#media_form', 'htmx:xhr:progress', function (evt) {
                    htmx.find('#progress').setAttribute('value', evt.detail.loaded / evt.detail.total * 100)
                });
            }
        });

        const videos = document.querySelectorAll('video');
        videos.forEach((video) => {
            video.addEventListener("click", () => {
              const isPaused = video.paused;
              video[isPaused ? "play" : "pause"]();
              video.classList.toggle("u-none", !isPaused);
            });
        });

        const mapContainer = document.getElementById("map");
        const goBack = document.getElementById("go-back");
        if (mapContainer !== null) {
            if (goBack !== null) {
                document.getElementById("go-back").addEventListener("click", () => {
                history.back();
                });
            }

            mapboxgl.accessToken = 'pk.eyJ1IjoiZG5pdHphIiwiYSI6ImNsZWIyY3ZzaTE0cjUzdm4xdnZ6czRlYjUifQ.FRETOXYRID6T2IoB7qqRLg';
            var map = new mapboxgl.Map({
                container: 'map',
                style: 'mapbox://styles/mapbox/streets-v11',
                maxZoom: 8
            });

            const markers = JSON.parse(mapContainer.dataset["markers"]);

            const bounds = new mapboxgl.LngLatBounds(markers[0], markers[0]);

            for (var i = 0; i < markers.length; i++) {
                bounds.extend(markers[i]);
            }

            map.fitBounds(bounds, { padding: 60 });

            for (var i = 0; i < markers.length; i++) {
                const marker = markers[i];
                const el = document.createElement("div");
                el.className = "map-marker";

                new mapboxgl.Marker(el)
                    .setLngLat(marker)
                    .addTo(map);
            }
        }
    });
})();
