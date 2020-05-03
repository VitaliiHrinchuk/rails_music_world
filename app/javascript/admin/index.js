// const Quill = require('./quill.min.js');
document.addEventListener('turbolinks:load', function () {
  let sidenav = document.querySelectorAll('.sidenav');
  let instances = M.Sidenav.init(sidenav);
  if (document.querySelector('.editor')) {
    let editor = new Quill('.editor', {
      placeholder: 'Контент',
      theme: 'snow',
      modules: {
        toolbar: [
          [{ font: [] }, { size: [] }],
          ['bold', 'italic', 'underline', 'strike'],
          [{ color: [] }, { background: [] }],
          [{ script: 'super' }, { script: 'sub' }],
          [{ header: '1' }, { header: '2' }, 'blockquote', 'code-block'],
          [
            { list: 'ordered' },
            { list: 'bullet' },
            { indent: '-1' },
            { indent: '+1' },
          ],
          ['link', 'image', 'video', 'formula'],
          ['clean'],
        ],
      },
    });

    let form = document.querySelector('.form-content');
    form.onsubmit = function (e) {
      let content = document.querySelector('input[name=content]');
      content.value = editor.container.firstChild.innerHTML;
    };
  }

  let table = document.querySelector('#dataTable');

  let dataTable = new DataTable(table, {
    searchable: true,
  });
});
