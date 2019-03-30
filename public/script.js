document.addEventListener("DOMContentLoaded", () => {
  let form = document.querySelector('form')
  let messages = document.querySelector('#messages')

  // document.querySelector('.main__chats').onclick = (e) => {
  //   alert(e.target.tagName)
  // }

  form.onsubmit = async (e) => {
    alert('チェック1')
    e.preventDefault()
    let formData = new FormData()
    let message = form.message.value
    if (message === '') return
    alert('チェック2')
    formData.append('message', message)
    const row = await fetch(location.href, {
      method: "post",
      body: formData
    })

    alert(row.status)
    
    if (row.status === 200) {
      const newMessage = document.createTextNode(message)
      const newMessageElement = document.createElement("li")
      newMessageElement.appendChild(newMessage)
      messages.appendChild(newMessageElement)
    }
  }

  }
)