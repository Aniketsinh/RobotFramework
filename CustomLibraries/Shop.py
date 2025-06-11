from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn


class Shop:


    def __init__(self):
        self.selLib = BuiltIn().get_library_instance('SeliniumLibrary')



    def hello(self):
        print("Hello from Shop Library")

    @keyword
    def add_to_cart_and_checkout(self, productlist):
        self.selLib.get_element("xpath=//a[@href='/cart']")
        pass  # <- This line prevents the IndentationError
