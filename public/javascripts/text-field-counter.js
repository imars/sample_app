
function updateCount( max)
{
    counter_field = document.micropost_form.elements["micropost_chars"];
    field_to_count = document.micropost_form.elements["micropost[content]"];
    counter_field.value = max - field_to_count.value.length;
}