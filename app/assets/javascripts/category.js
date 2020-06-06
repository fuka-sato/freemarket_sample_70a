$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                        <div class='listing-select-wrapper__box'>
                          <select class="listing-select-wrapper__box--select" id="child_category" name="category_id">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                          <i class='fas fa-chevron-down listing-select-wrapper__box--arrow-down'></i>
                        </div>
                      </div>`;
    $('.listing-product-detail__category').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='listing-select-wrapper__added' id= 'grandchildren_wrapper'>
                              <div class='listing-select-wrapper__box'>
                                <select class="listing-select-wrapper__box--select" id="grandchild_category" name="category_id">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                                <i class='fas fa-chevron-down listing-select-wrapper__box--arrow-down'></i>
                              </div>
                            </div>`;
    $('.listing-product-detail__category').append(grandchildSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('.listing-product-detail__category').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
});







// const select = document.querySelector("#parent-form");

// select.mouseover("click", function () {
//   console.log(value)
// })


// const select = document.getElementById('Parent-form');

// select.addEventListener("onchange", function(){
//   alert(ok);
// });
// $('#select-category').mouseenter(function(event) {
//   $(function (){
//     // 子カテゴリーを追加するための処理です。
//     function buildChildHTML(child){
//         var html =`<a class="child_category" id="${child.id}" 
//                     href="/category/${child.id}">${child.name}</a>`;
//         return html;
//     }
    
//     $(".parent_category").on("mouseover", function() {
//       var id = this.id//どのリンクにマウスが乗ってるのか取得します
//       $(".now-selected-red").removeClass("now-selected-red")//赤色のcssのためです
//       $('#' + id).addClass("now-selected-red");//赤色のcssのためです
//       $(".child_category").remove();//一旦出ている子カテゴリ消します！
//       $(".grand_child_category").remove();//孫、てめえもだ！
//       $.ajax({
//         type: 'GET',
//         url: '/item/new',//とりあえずここでは、newアクションに飛ばしてます
//         data: {parent_id: id},//どの親の要素かを送ります　params[:parent_id]で送られる
//         dataType: 'json'
//       }).done(function(children) {
//         children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
//           var html = buildChildHTML(child);//HTMLにして
//           $(".children_list").append(html);//リストに追加します
//         })
//       });
//     });
  
//     // 孫カテゴリを追加する処理です　基本的に子要素と同じです！
//     function buildGrandChildHTML(child){
//       var html =`<a class="grand_child_category" id="${child.id}"
//                   href="/category/${child.id}">${child.name}</a>`;
//       return html;
//     }
  
//     $(document).on("mouseover", ".child_category", function () {//子カテゴリーのリストは動的に追加されたHTMLのため
//       var id = this.id
//       $(".now-selected-gray").removeClass("now-selected-gray");//灰色のcssのため
//       $('#' + id).addClass("now-selected-gray");//灰色のcssのため
//       $.ajax({
//         type: 'GET',
//         url: '/category/new',
//         data: {parent_id: id},
//         dataType: 'json'
//       }).done(function(children) {
//         children.forEach(function (child) {
//           var html = buildGrandChildHTML(child);
//           $(".grand_children_list").append(html);
//         })
//         $(document).on("mouseover", ".child_category", function () {
//           $(".grand_child_category").remove();
//         });
//       });
//     });
//   });
// })


