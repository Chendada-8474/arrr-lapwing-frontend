

const token = window.localStorage.getItem("token")

if (!token) {
    window.location = "#/auth/login"
}


