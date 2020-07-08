$(function(){
  function buildHTML(message){
    if ( message.image ) {
      let html =
        `<div class="chat__main__name2">
        <p class="m-name">
          ${message.user_name}
        </p>
        <p class="date">
          ${message.created_at}
        </p>
        </div>
        <p class="message">
          ${message.content}
        </p>
        <div class="chat__main__message">
          <p class="message">
          <img class="Message__image" src="${message.image}">
          </p>
        </div>`
      return html;
    } else {
      let html =
      `<div class="chat__main__name2">
      <p class="m-name">
        ${message.user_name}
      </p>
      <p class="date">
        ${message.created_at}
      </p>
      </div>
      <p class="message">
      ${message.content}
      </p>`
      return html;
    };
  }

  $('.Form').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log(data)
      let html = buildHTML(data);
      $('.chat__main').append(html);      
      $('form')[0].reset();
      $('.chat__main').animate({ scrollTop: $('.chat__main')[0].scrollHeight});
      $('.Form__submit').prop('disabled', false);
    })
  });
});
