$( document ).ready(function() {

    $('button[type="submit"]').click(function() {
        var data = [];
        $( 'input[type="checkbox"]').each( function() {
            data.push(this.id + "=" + this.checked);
        });

        $( 'input[type="number"]' ).each(function() {
            data.push(this.id + "=" + $(this).val());
        });

        $( 'input[type="text"]' ).each(function() {
            data.push(this.id + "=" + $(this).val());
        });

        var dataStr = '?' + data.join('&');

        $.ajax("/prediction" + dataStr)
            .done(function(result) {
                $('#prediction').text(result);
            });
    })
});