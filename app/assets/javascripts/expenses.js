function OnloadFunction ()
{
  $('.index-data').on('click', '.bla', () => {
    alert('works!!')
  })
}
$(document).ready(OnloadFunction);
