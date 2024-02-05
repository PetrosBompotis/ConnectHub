$(document).ready(function() {
    var isLoading = false;
    if ($('.infinite-scroll').length > 0) {
        $(window).on('scroll', function() {
            var more_posts_url = $('.pagination a.next_page').attr('href');
            var threshold_passed = $(window).scrollTop() > $(document).height() - $(window).height() - 60;
            if (!isLoading && more_posts_url && threshold_passed) {
                isLoading = true;
                console.log('Before AJAX request');
                $.getScript(more_posts_url).done(function(data, textStatus, jqxhr) {
                    console.log('AJAX request successful');
                    isLoading = false;
                }).fail(function() {
                    console.log('AJAX request failed');
                    isLoading = false;
                });
                console.log('After AJAX request');

            }
        });
    }
});
