import Vue from 'vue'
import Chiikomas from '../chiikomas.vue'

document.addEventListener('DOMContentLoaded', () => {
  const selector = '#js-chiikomas'
  const chiikomas = document.querySelector(selector)
  if (chiikomas) {
    new Vue({
      render: h => h(Chiikomas)
    }).$mount(selector)
  }
})

window.onload = function () {
  const cookieArray = new Array();
  if (document.cookie != '') {
    const tmp = document.cookie.split('; ');
    for (let i = 0; i < tmp.length; i++) {
      const data = tmp[i].split('=');
      cookieArray[data[0]] = decodeURIComponent(data[1]);
    }
  }

  const modalBrowse = cookieArray["modalBrowse"];
  const modal = document.getElementById("js_modal");

  if (!modalBrowse) {
    modal.classList.add("is_active");
    document.cookie = 'modalBrowse=allready; max-age=86400'; // 一時的に60秒後にセット
  }

  const modalClose = document.getElementsByClassName('js_modal_close');
  for (var i = 0; i < modalClose.length; i++) {
    modalClose[i].onclick = function () {
      modal.classList.remove("is_active");
    }
  }

}
