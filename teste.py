from PyQt5.QtWidgets import QApplication, QMainWindow, QLabel, QLineEdit, QPushButton, QVBoxLayout, QWidget

class LoginWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        self.setWindowTitle('Tela de Login')

        # Crie os widgets
        self.label_username = QLabel('Username:')
        self.label_password = QLabel('Password:')
        self.input_username = QLineEdit()
        self.input_password = QLineEdit()
        self.button_login = QPushButton('Login')

        # Crie um layout para os widgets
        layout = QVBoxLayout()
        layout.addWidget(self.label_username)
        layout.addWidget(self.input_username)
        layout.addWidget(self.label_password)
        layout.addWidget(self.input_password)
        layout.addWidget(self.button_login)

        # Crie um widget central e defina o layout nele
        widget = QWidget()
        widget.setLayout(layout)

        # Defina o widget central da janela principal
        self.setCentralWidget(widget)

    def handle_login(self):
        username = self.input_username.text()
        password = self.input_password.text()

        # Verifique as credenciais e tome a ação apropriada
        if username == 'admin' and password == 'password':
            print('Login bem-sucedido!')
        else:
            print('Credenciais inválidas.')

        # Conecte a função handle_login ao evento de clique do botão de login
        self.button_login.clicked.connect(self.handle_login)

if __name__ == '__main__':
    app = QApplication([])
    window = LoginWindow()
    window.show()
    app.exec_()
