!function(t){var i=t.autosize={active:!0};t.fn.autosize=function(i){var s={size:100,method:"fit"};return i=t.extend(s,i),this.each(function(){e[i.method](t(this),i)})},t(window).resize(function(){if(i.active){var e=t(this);t(".autosize").each(function(){var i=t(this),o=i.data("autosize");s[o.method](e,i,o)})}});var e={fit:function(t,i){i.ratio=i.width/i.height;var e=100-i.size;i.size=""+i.size+"%",i.current="width",t.css("position","absolute").css("left",e).css("top",e),t.css("width",i.size),t.data("autosize",i),t.addClass("autosize")}},s={fit:function(t,i,e){var s=t.width()/t.height(),o=e.ratio>s?"height":"width";console.log("best fit: ",o," current: ",e.current),e.current!=o&&(console.log("change! to:",o),i.css(e.current,"").css(o,e.size),e.current=o)}}}(jQuery);