$(function(){
  function buildHTML(message){
    if ( message.image ) {
      let html =
        `<div class="MessageBox" data-message-id=${message.id}>
          <div class="chat__main__name2">
            <div class="m-name">
              ${message.user_name}
            </div>
            <div class="date">
              ${message.created_at}
            </div>
          </div>
          <div class="chat__main__message">
            <p class="message">
              ${message.content}
            </p>
            <img class="Message__image" src="${message.image}">
          </div>
        </div>`
      return html;
    } else {
      let html =
        `<div class="MessageBox" data-message-id=${message.id}>
          <div class="chat__main__name2">
            <div class="m-name">
              ${message.user_name}
            </div>
            <div class="date">
              ${message.created_at}
            </div>
          </div>
          <div class="chat__main__message">
            <p class="message">
              ${message.content}
            </p>
          </div>
        </div>`
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
      let html = buildHTML(data);
      $('.chat__main').append(html);      
      $('form')[0].reset();
      $('.chat__main').animate({ scrollTop: $('.chat__main')[0].scrollHeight});
      $('.Form__submit').prop("disabled", false);
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
      $('.Form__submit').prop("disabled", false);
    });
    
  });
});