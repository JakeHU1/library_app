const switchTheme = (checkbox) => {
    if (checkbox.checked) {
        document.body.classList.add('bg-dark');
        document.getElementsByTagName('H1')[0].classList.add('text-white');
        nav = document.getElementById('nav');
        nav.classList.remove('navbar-light', 'bg-light');
        nav.classList.add('navbar-dark', 'bg-dark');
    } else {    
        document.body.classList.remove('bg-dark');
        document.getElementsByTagName('H1')[0].classList.remove('text-white');
        nav = document.getElementById('nav');
        nav.classList.remove('navbar-dark', 'bg-dark');
        nav.classList.add('navbar-light', 'bg-light');
    }
}