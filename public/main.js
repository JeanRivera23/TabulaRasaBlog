document.addEventListener("DOMContentLoaded", function (event) {
  var edit = document.getElementById("edit")
  var editForm = document.getElementById("editForm")

  editForm.style.display = "none"

  edit.addEventListener("click", function() {
    editForm.style.display = "block"
  })

})
