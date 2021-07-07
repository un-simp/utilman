from tkinter import *
import os
import sys
import subprocess


# import filedialog module
from tkinter import filedialog

# Function for opening the
# file explorer window
def browseFiles():
	filename = filedialog.askopenfilename(initialdir = "/",title = "Select a File",)
	# Change label contents
	label_file_explorer.configure(text="File selected: "+filename)
	subprocess.run(filename)
    

# Create the root window
window = Tk()

# Set window title
window.title('Utilman')

# Set window size
window.geometry("640x480")

#Set window background color
window.config(background = "white")
def quitapp():
        os._exit(0)
# Create a File Explorer label
label_file_explorer = Label(window,text = "Utilman Opener",width = 100, height = 4,fg = "blue")																				
button_explore = Button(window,text = "Select and Open App",command = browseFiles)								
button_exit = Button(window,text = "Exit",command = quitapp)



label_file_explorer.grid(column = 1, row = 1)
button_explore.grid(column = 1, row = 2)
button_exit.grid(column = 1,row = 3)
# Let the window wait for any events
window.mainloop()
