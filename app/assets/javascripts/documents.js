$(function() {
  $(document).bind('ajax:success', function(e, data) {
    $('#similarity').html("<h3>Your documents are "+data.similarity+"% similar</h3>");


    $('#doc1-num-words').html(data.doc1.sum);
    $('#doc2-num-words').html(data.doc2.sum);

    $('#doc1-uniq-words').html(data.doc1.uniq);
    $('#doc2-uniq-words').html(data.doc2.uniq);
  });
});
