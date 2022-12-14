
  const home_page = document.getElementsByClassName('form__container')

  if ( home_page.length > 0 ) {
    const btn__todo = document.querySelector(".btn__todo");
    const input__todo = document.querySelector('.input__todo')

    btn__todo.addEventListener('click', () =>{
      console.log(input__todo.value)
      // input__todo.value = ''
    })

  }







