function enrollCourse(route, curso_id, aluno_id) {
  if ($("#danger_explanation").length != 0)
    $("#danger_explanation").remove();
  if ($(".alert").length != 0)
    $(".alert").remove();

  var registration_course =
  {
    'registration_course' : {
      'curso_id' : curso_id,
      'aluno_id' : aluno_id
    }
  };

  $.ajax({
    url: route,
    type: 'POST',
    data: registration_course,
    dataType: 'JSON',
    success: function(data) {
      if (data.status) {
        if ($("#error_explanation").length != 0)
          $("#error_explanation").remove();

        if ($("#success_explanation").length == 0)
          $("main").prepend("<div id=\"success_explanation\" class=\"alert alert-success\"><button class=\"close\" aria-hidden=\"true\" data-dismiss=\"alert\" type=\"button\">×</button><div id=\"flash_notice\">" + data.message + "</div></div>");
        else
          $("#success_explanation").val("<button class=\"close\" aria-hidden=\"true\" data-dismiss=\"alert\" type=\"button\">×</button><div id=\"flash_notice\">" + data.message + "</div>");

        $("button#matricular_curso").attr("disabled", true);
      } else {
        if ($("#success_explanation").length != 0)
          $("#success_explanation").remove();

        var message = showMessage(data.message);
        if ($("#error_explanation").length == 0) {
          $("main").prepend("<div id=\"error_explanation\"><h2>" + ((message.count_errors > 1) ? message.count_errors + ' erros' : '1 error')  + " prohibited this registration_course from being saved:</h2><ul>" + message.text_message + "</ul></div>");
        } else{
          $("#error_explanation").val("<h2>" + ((message.count_errors > 1) ? message.count_errors + ' erros' : '1 error')  + " prohibited this registration_course from being saved:</h2><ul>" + message.text_message + "</ul>");
        }
      }
    },
    error: function(errors) {
      if ($("#success_explanation").length != 0)
          $("#success_explanation").remove();
      if ($("#error_explanation").length != 0)
        $("#error_explanation").remove();

      if ($("#danger_explanation").length == 0)
        $("main").prepend("<div id=\"danger_explanation\" class=\"alert alert-danger\"><button class=\"close\" aria-hidden=\"true\" data-dismiss=\"alert\" type=\"button\">×</button><div id=\"flash_danger\">Você não tem permição para executar esta ação.</div></div>");
      else
        $("#danger_explanation").val("<button class=\"close\" aria-hidden=\"true\" data-dismiss=\"alert\" type=\"button\">×</button><div id=\"flash_danger\">Você não tem permição para executar esta ação.</div>");
    }
  });

  return false;
}

function showMessage(messages) {
  var text_message = "",
        count_errors = 0;

  $.each(messages, function(key, value) {
    $.each(value, function(messageKey, messageValue) {
      count_errors++;
      text_message += "<li>" + capitilezeFirstLetter(key) + " " + messageValue + "</li>";
    });
  });

  return { text_message : text_message, count_errors : count_errors };
}

function capitilezeFirstLetter(str, force=true){
  str=force ? str.toLowerCase() : str;
  return str.replace(/(\b)([a-zA-Z])/,
    function(firstLetter){
      return firstLetter.toUpperCase();
    });
}

function capitilezeLetterWords(str,force){
  str=force ? str.toLowerCase() : str;
  return str.replace(/(\b)([a-zA-Z])/g,
    function(firstLetter){
      return firstLetter.toUpperCase();
    });
}

function showDiscipline(route) {
  $.ajax({
    url: route,
    type: 'GET',
    dataType: 'JSON',
    success: function(data) {
      $("#read_workload").text(data.workload);
      $("#read_professor").text(data.professor.nome);
      $("#read_description").text(data.description);
      $("#read_ementa").text(data.ementa);
      $("#read_bibliography").text(data.bibliography);
    },
    error: function(errors) {
      console.log("errors", errors);
    }
  });

  return false;
}