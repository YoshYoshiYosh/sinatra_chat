document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector('form');
  const messages = document.querySelector('#messages');

  form.onsubmit = async (e) => {
    e.preventDefault();
    const formData = new FormData();
    const message = form.message.value;
    if (message === '') return;
    formData.append('message', message);
    const row = await fetch(location.href, {
      method: "post",
      body: formData
    });
    
    if (row.status === 200) {
      const newMessage = document.createTextNode(message);
      let newMessageElement = document.createElement("li");
      const br = document.createElement('br')
      newMessageElement.className = 'd-inline-block bg-dark rounded px-2 py-1 mb-2 text-light'
      newMessageElement.appendChild(newMessage);
      messages.appendChild(newMessageElement);
      messages.appendChild(br);
      form.message.value = ""
    }
  };
});