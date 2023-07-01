/*
Markdown Gallery
-- v1.0 2016
-- Created by Lee Penney
-- Released under GPLv3
*/

function md_gallery(config) {
    var config = config || {},
        list_type = config.list_type || 'ul',
        class_name = config.class_name || 'gallery',
        tag_type = config.tag_type || 'div';

    function find_lists(list_type) {
        var lists = document.getElementsByTagName(list_type), matching_lists = [];
        for (var i = 0; i < lists.length; i++) {
            var list_elements = lists[i].children;
            var total_matches = 0;
            for (var c = 0; c < list_elements.length; c++) {
                if (!list_elements[c].textContent.length && (list_elements[c].firstChild.tagName == 'A' || list_elements[c].firstChild.tagName == 'IMG') && (!list_elements[c].firstChild.firstChild || (list_elements[c].firstChild.firstChild && list_elements[c].firstChild.firstChild.tagName == 'IMG') )) {
                    total_matches++;
                }
            }
            if (total_matches == list_elements.length) {
                matching_lists[matching_lists.length] = lists[i];
            }
        }
        return matching_lists;
    }

    function prepend_tag(img_lists, list_tag, prepend_tag, class_name) {
        for (var i = 0; i < img_lists.length; i++) {
            // add_figure_tags(img_lists[i]);
            add_anchor(img_lists[i]);
            wrap_tag(img_lists[i], prepend_tag, class_name, null, true);
            strip_tag(img_lists[i], 'li');
            strip_tag(img_lists[i].parentNode, list_tag);
        }
    }

    function append_caption(el) {
        if ((el.tagName == 'A' && el.firstChild.tagName == 'IMG' && el.firstChild.hasAttribute('alt') && el.firstChild.getAttribute('alt').length > 0) || (el.tagName == 'IMG' && el.hasAttribute('alt') && el.getAttribute('alt').length > 0)) {
            var caption = document.createElement('figcaption');
            try {
                caption.textContent = el.firstChild.getAttribute('alt')
                el.appendChild(caption);
            } catch (e) {
                caption.textContent = el.getAttribute('alt');
                el.parentNode.appendChild(caption);
            }
        }
    }

    function strip_tag(el, tag_type) {
        var start_tag_regex = new RegExp('<'+tag_type+'>', 'gi');
        var end_tag_regex = new RegExp('<\/'+tag_type+'>', 'gi');
        el.innerHTML = el.innerHTML.replace(start_tag_regex,'').replace(end_tag_regex,'');
    }

    function add_figure_tags(img_list) {
        var list_elements = img_list.children;
        for (var i = 0; i < list_elements.length; i++) {
            append_caption(list_elements[i].firstChild);
            wrap_tag(list_elements[i], 'figure');
        }
    }

    function add_anchor(img_list) {
        var list_elements = img_list.children;
        for (var i = 0; i < list_elements.length; i++) {
            let img = list_elements[i].getElementsByTagName('img')[0];
            let src = img.getAttribute("src");
            let alt = img.getAttribute("alt");
            wrap_tag(list_elements[i],
                'a',
                'hover:cursor-pointer',
                "$dispatch('img-modal', {  imgModalSrc: '" + src + "', imgModalDesc: '" + alt + "' })",
                false
                );
        }
    }

    function wrap_tag(el, tag_type, class_name, click, root) {
        var wrap = document.createElement(tag_type);
        if (root) {
            wrap.setAttribute('x-data', "{}");
        }
        if (class_name) {
            wrap.setAttribute('class', class_name);
        }
        if (click) {
            wrap.setAttribute('x-on:click.prevent', click);
            wrap.setAttribute('href', '#');
        }
        el.parentNode.replaceChild(wrap, el);
        wrap.appendChild(el);
    }

    var found_img_lists = find_lists(list_type);
    if (found_img_lists.length) {
        prepend_tag(found_img_lists, list_type, tag_type, class_name);
    }
}