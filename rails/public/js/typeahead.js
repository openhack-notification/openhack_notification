var source = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('id', 'title'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    /* local: links */
    prefetch: {
      url: '/bulletins.json',
      ttl: 0
    }    
});
source.initialize();

$('#scrollable-dropdown-menu .typeahead').typeahead(null, {
    displayKey: 'title',
    limit: 5,
    source: source.ttAdapter(),
    templates: {
        empty: [
          '<div class="empty-message">',
          '해당 혜택은 없습니다.',
          '</div>'
        ].join('\n'),
        suggestion: Handlebars.compile
        (
            '<li class="search-univ">' +
            '<a href="/bulletins/{{id}}/posts" style="text-decoration: none;">' +
            '<div>' +
            '<div class="etc"><span style="font-size: 30px;">{{title}}</span></div>' +
            '</div>' +
            '</a>' +
            '<hr/>' +
            '</li>'
        )
    }
});