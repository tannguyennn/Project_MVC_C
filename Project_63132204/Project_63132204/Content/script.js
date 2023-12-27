let navbar = document.querySelector('#navbar .container ul li a');
let profile = document.querySelector('#navbar .container .profile');

document.querySelector('#user-btn').onclick = () => {
    profile.classList.toggle('active');
    navbar.classList.remove('active');
}