//= require jquery
//= require jquery_ujs
//= require semantic-ui
//= require_tree .



$(document).ready(function () {

  // Semantic-ui 公用js 初始化
  // 下拉事件
  $('.ui.dropdown:not([data-placeholder])').dropdown();

  $('.ui.dropdown[data-placeholder="false"]').dropdown({
    placeholder: false
  });

  $('.ui.dropdown').dropdown();

  $('.ui.checkbox:not([data-x]').checkbox();

  //  关闭提示
  $('.message .close').on('click', function () {
    $(this)
      .closest('.message')
      .transition('fade')
  });


  $('.ui.fluid.search.dropdown').dropdown();


  $("#publish_date").calendar({
    type: "datetime",
    ampm: false,
    text: {
      days: ['日', '一', '二', '三', '四', '五', '六'],
      months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
      monthsShort: ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"],
      today: "今天",
      now: '现在',
      am: '上午',
      pm: '下午'
    },
    formatter: {
      date: function (date, settings) {
        if (!date) return '';
        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();
        return year + '-' + month + '-' + day;
      }
    }
  })


  // 照片预览
  $(".js-input-image").change(function () {
    (function (input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $(input).parents('.js-image-preview-warp').find('.js-preview').attr('src', e.target.result);
        }
        $(input).parents('.js-image-preview-warp').find('.js-preview').show();
        reader.readAsDataURL(input.files[0]);
      }
    })(this);
    var that = $(this)
    that.parents('.js-image-preview-warp').find('.js-input-file-name').text(that.val().replace(/C:\\fakepath\\/i, ''))
  });


  var selection = document.querySelector('.ckeditor');
  if (selection !== null) {
    ClassicEditor.create(selection, {
      simpleUpload: {
        uploadUrl: '/cms/uploads'
      }
    });
  }

});