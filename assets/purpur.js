/*
 * Purpur 0.0.2
 * https://github.com/cimon-io/purpur
 * Licensed under the MIT License: http://www.opensource.org/licenses/mit-license.php
 * Copyright 2015 Alexey Osipenko <alexey@osipenko.in.ua>
 */

(function(document, undefined){
  "use strict";

  var tmpl = '<span class="icon" data-icon="{{iconName}}" data-icon-size="{{iconSize}}"><span class="icon--wrapper"><svg class="icon--cnt"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="{{assetPath}}#{{iconName}}" x="0" y="0"></use></svg></span></span>';

  var template = function (options) {
    var result = "" + tmpl;

    for (var key in options) {
      result.replace(new RegExp('{{' + key + '}}', 'g'), options[key])
    }

    return result;
  }

  document.purpur = {
    size: function (s) {
      // TODO: do not forget to change duplication of this list in purpur.rb
      return ({
        'xsmall': 'xsm',
        'extrasmall': 'xsm',
        'xsm': 'xsm',
        'small': 'sm',
        'sm': 'sm',
        'medium': 'm',
        'm': 'm',
        'md': 'm',
        'large': 'lg',
        'lg': 'lg',
        'big': 'xl',
        'xl': 'xl',
        'huge': 'xxl',
        'xxl': 'xxl'
      })[s || 'medium'];
    },

    name: function (n) {
      return n;
    },

    html: function (n, s) {
      return template({ iconName: this.name(n), iconSize: this.size(s), assetPath: assetPath });
    }
  };

})(window.document)
