(() => {
  // slices/main/assets/js/gallery.js
  function md_gallery(config) {
    var config = config || {}, list_type = config.list_type || "ul", class_name = config.class_name || "gallery", tag_type = config.tag_type || "div";
    function find_lists(list_type2) {
      var lists = document.getElementsByTagName(list_type2), matching_lists = [];
      for (var i = 0; i < lists.length; i++) {
        var list_elements = lists[i].children;
        var total_matches = 0;
        for (var c = 0; c < list_elements.length; c++) {
          if (!list_elements[c].textContent.length && (list_elements[c].firstChild.tagName == "A" || list_elements[c].firstChild.tagName == "IMG") && (!list_elements[c].firstChild.firstChild || list_elements[c].firstChild.firstChild && list_elements[c].firstChild.firstChild.tagName == "IMG")) {
            total_matches++;
          }
        }
        if (total_matches == list_elements.length) {
          matching_lists[matching_lists.length] = lists[i];
        }
      }
      return matching_lists;
    }
    function prepend_tag(img_lists, list_tag, prepend_tag2, class_name2) {
      for (var i = 0; i < img_lists.length; i++) {
        add_anchor(img_lists[i]);
        wrap_tag(img_lists[i], prepend_tag2, class_name2, null, true);
        strip_tag(img_lists[i], "li");
        strip_tag(img_lists[i].parentNode, list_tag);
      }
    }
    function append_caption(el) {
      if (el.tagName == "A" && el.firstChild.tagName == "IMG" && el.firstChild.hasAttribute("alt") && el.firstChild.getAttribute("alt").length > 0 || el.tagName == "IMG" && el.hasAttribute("alt") && el.getAttribute("alt").length > 0) {
        var caption = document.createElement("figcaption");
        try {
          caption.textContent = el.firstChild.getAttribute("alt");
          el.appendChild(caption);
        } catch (e) {
          caption.textContent = el.getAttribute("alt");
          el.parentNode.appendChild(caption);
        }
      }
    }
    function strip_tag(el, tag_type2) {
      var start_tag_regex = new RegExp("<" + tag_type2 + ">", "gi");
      var end_tag_regex = new RegExp("</" + tag_type2 + ">", "gi");
      el.innerHTML = el.innerHTML.replace(start_tag_regex, "").replace(end_tag_regex, "");
    }
    function add_figure_tags(img_list) {
      var list_elements = img_list.children;
      for (var i = 0; i < list_elements.length; i++) {
        append_caption(list_elements[i].firstChild);
        wrap_tag(list_elements[i], "figure");
      }
    }
    function add_anchor(img_list) {
      var list_elements = img_list.children;
      for (var i = 0; i < list_elements.length; i++) {
        let img = list_elements[i].getElementsByTagName("img")[0];
        let src = img.getAttribute("src");
        let alt = img.getAttribute("alt");
        wrap_tag(
          list_elements[i],
          "a",
          "hover:cursor-pointer",
          "$dispatch('img-modal', {  imgModalSrc: '" + src + "', imgModalDesc: '" + alt + "' })",
          false
        );
      }
    }
    function wrap_tag(el, tag_type2, class_name2, click, root) {
      var wrap = document.createElement(tag_type2);
      if (root) {
        wrap.setAttribute("x-data", "{}");
      }
      if (class_name2) {
        wrap.setAttribute("class", class_name2);
      }
      if (click) {
        wrap.setAttribute("x-on:click.prevent", click);
        wrap.setAttribute("href", "#");
      }
      el.parentNode.replaceChild(wrap, el);
      wrap.appendChild(el);
    }
    var found_img_lists = find_lists(list_type);
    if (found_img_lists.length) {
      prepend_tag(found_img_lists, list_type, tag_type, class_name);
    }
  }

  // slices/main/assets/js/app.js
  (function() {
    document.addEventListener("DOMContentLoaded", function() {
      window.matchMedia("(prefers-color-scheme: dark)").addEventListener("change", (event) => {
        localStorage.setItem("_x_darkMode", event.matches ? true : false);
      });
      if (window.hljs !== void 0) {
        window.hljs.highlightAll();
      }
      const times = document.querySelectorAll("time");
      times.forEach((time) => {
        const oldDtime = Date.parse(time.dateTime);
        time.innerHTML = new Date(oldDtime).toLocaleDateString(navigator.language, { weekday: "long", year: "numeric", month: "short", day: "numeric" });
        md_gallery({
          "class_name": "grid gap-4 grid-cols-2 prose-img:m-0"
        });
        const mediaForm = document.getElementById("media_form");
        if (mediaForm !== null) {
          htmx.on("#media_form", "htmx:xhr:progress", function(evt) {
            htmx.find("#progress").setAttribute("value", evt.detail.loaded / evt.detail.total * 100);
          });
        }
      });
      const videos = document.querySelectorAll("video");
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
        mapboxgl.accessToken = "pk.eyJ1IjoiZG5pdHphIiwiYSI6ImNsZWIyY3ZzaTE0cjUzdm4xdnZ6czRlYjUifQ.FRETOXYRID6T2IoB7qqRLg";
        var map = new mapboxgl.Map({
          container: "map",
          style: "mapbox://styles/mapbox/streets-v11",
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
          new mapboxgl.Marker(el).setLngLat(marker).addTo(map);
        }
      }
    });
  })();
})();
