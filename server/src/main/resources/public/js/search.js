$("#select2-search").select2({
    ajax: {
        url: "/admin/search.html",
        dataType: 'json',
        delay: 250,
        data: function (params) {
            return {
                q: params.term // search term
            };
        },
        processResults: function (data, params) {
            // parse the results into the format expected by Select2
            // since we are using custom formatting functions we do not need to
            // alter the remote JSON data, except to indicate that infinite
            // scrolling can be used
            params.page = params.page || 1;
            return {
                results: data
                // pagination: {
                //     more: (params.page * 30) < data.total_count
                // }
            };
        },
        cache: true
    },
    placeholder: '搜索',
    minimumInputLength: 1,
    templateResult: formatRepo,
    templateSelection: formatRepoSelection
});

function formatRepo (repo) {
    if (repo.loading) {
        return repo.text;
    }
    console.log(repo)
    var $container = $(
        "<div class='select2-result-repository clearfix'>" +
        // "<div class='select2-result-repository__avatar'><img src='" + repo.owner.avatar_url + "' /></div>" +
        "<div class='select2-result-repository__meta'>" +
        "<a class='select2-result-repository__title' onclick=setSelVal("+repo.visitId+",\'"+repo.value+"\') href='/admin/id/show?qq="+repo.visitId+"' target='_blank'></a>" +
        "<div class='select2-result-repository__description'></div>" +
        // "<div class='select2-result-repository__statistics'>" +
        // "<div class='select2-result-repository__forks'><i class='fa fa-flash'></i> </div>" +
        // "<div class='select2-result-repository__stargazers'><i class='fa fa-star'></i> </div>" +
        // "<div class='select2-result-repository__watchers'><i class='fa fa-eye'></i> </div>" +
        // "</div>" +
        "</div>" +
        "</div>"
    );
    $container.find(".select2-result-repository__title").text(repo.value);
    $container.find(".select2-result-repository__description").text(repo.type);
    // $container.find(".select2-result-repository__forks").append(repo.forks_count + " Forks");
    // $container.find(".select2-result-repository__stargazers").append(repo.stargazers_count + " Stars");
    // $container.find(".select2-result-repository__watchers").append(repo.watchers_count + " Watchers");

    return $container;
}

function formatRepoSelection (repo) {
    console.log(repo);
    return repo.full_name || repo.value;
}

function setSelVal(id,txt){
    $("#qq").val(id);
    $("#select2-search").val(txt);
}