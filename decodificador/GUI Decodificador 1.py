import tkinter as tk
from tkinter import filedialog

archivo_entrada = ""
archivo_salida = ""

codigos_TipoR = {
    'add': {'op': '000000', 'funct': '100000'},  # ADD
    'sub': {'op': '000000', 'funct': '100010'},  # SUBstract
    'and': {'op': '000000', 'funct': '100100'},  # AND
    'or': {'op': '000000', 'funct': '100101'},   # OR
    'slt': {'op': '000000', 'funct': '101010'},  # SLT-set on less than
}

def decodificar_instrucciones():
    global archivo_entrada
    global archivo_salida
    with open(archivo_entrada) as entrada, open(archivo_salida, 'w') as salida:
        for linea in entrada:
            instruccion_binaria = decodificar_linea(linea.strip(), codigos_TipoR)
            salida.write(instruccion_binaria + '\n')
    return archivo_salida

def decodificar_linea(linea, codigos_TipoR):
    partes = linea.split(',')
    operacion = partes[0]
    registro_fuente1 = partes[1]
    registro_fuente2 = partes[2]
    registro_destino = partes[3]

    informacion_operacion = codigos_TipoR[operacion]

    opcode = informacion_operacion['op']
    funct = informacion_operacion['funct']
    fs = f'{int(registro_fuente1):05b}'
    ft = f'{int(registro_fuente2):05b}'
    fd = f'{int(registro_destino):05b}'
    shamt = '0' * 5

    codigo_binario = (opcode + fs + ft + fd + shamt + funct)

    return codigo_binario

def abrir_archivo():
    global archivo_entrada
    archivo_entrada = filedialog.askopenfilename(filetypes=[("Archivos ASM", "*.asm")])
    if archivo_entrada:
        with open(archivo_entrada, 'r') as file:
            contenido = file.read()
        texto_archivo_entrada.config(state=tk.NORMAL)
        texto_archivo_entrada.delete(1.0, tk.END)
        texto_archivo_entrada.insert(1.0, contenido)
        texto_archivo_entrada.config(state=tk.DISABLED)

def guardar_archivo():
    global archivo_salida
    archivo_salida = filedialog.asksaveasfilename(defaultextension=".txt")
    if archivo_salida:
        texto_archivo_salida.delete(1.0, tk.END)
        texto_archivo_salida.insert(1.0, archivo_salida)

def decodificar_y_guardar():
    archivo_entrada = texto_archivo_entrada.get(1.0, tk.END).strip()
    archivo_salida = texto_archivo_salida.get(1.0, tk.END).strip()
    if archivo_entrada and archivo_salida:
        decodificar_instrucciones()
        mensaje_estado.config(text="Archivo decodificado y guardado correctamente.", fg="green")
    else:
        mensaje_estado.config(text="Por favor, SELECCIONE archivos de entrada y salida.", fg="red")

def editar_archivo():
    global archivo_entrada

    if(archivo_entrada):
        editor = tk.Toplevel(root)
        editor.title("Editor de Archivo")

        texto_editor = tk.Text(editor, height=20, width=60)
        texto_editor.pack(padx=10, pady=10)

        contenido_actual = texto_archivo_entrada.get(1.0, tk.END).strip()
        texto_editor.insert(tk.END, contenido_actual)


        def guardar_cambios():
            contenido = texto_editor.get(1.0, tk.END).strip()
            texto_archivo_entrada.config(state=tk.NORMAL)
            texto_archivo_entrada.delete(1.0, tk.END)
            texto_archivo_entrada.insert(tk.END, contenido)
            texto_archivo_entrada.config(state=tk.DISABLED)
            editor.destroy()

            with open(archivo_entrada, 'w') as entrada:
                entrada.write(contenido)

        boton_guardar_cambios = tk.Button(editor, text="Guardar Cambios", command=guardar_cambios)
        boton_guardar_cambios.pack(pady=10)

def preview():
    global archivo_entrada
    if archivo_entrada:
        with open(archivo_entrada, 'r') as file:
            contenido = file.read()

        ventana = tk.Toplevel(root)
        ventana.title("Preview del archivo de entrada")

        texto_editor = tk.Text(ventana, height=20, width=60)
        texto_editor.pack(padx=10, pady=10)

        contenido_actual = texto_archivo_entrada.get(1.0, tk.END).strip()
        texto_editor.insert(tk.END, contenido_actual)

        def destruir_ventana():
            ventana.destroy()

        boton_guardar_cambios = tk.Button(ventana, text="Cerrar ventana", command=destruir_ventana)
        boton_guardar_cambios.pack(pady=10)

def salir():
    root.destroy()


# Crear la ventana principal
root = tk.Tk()
root.title("Decodificador de Instrucciones")

# Crear los elementos de la interfaz
tk.Label(root, text="Archivo de Entrada:").grid(row=0, column=0, sticky="w")
texto_archivo_entrada = tk.Text(root, height=2, width=50)
texto_archivo_entrada.config(state=tk.DISABLED)
texto_archivo_entrada.grid(row=0, column=1)
boton_abrir = tk.Button(root, text="Abrir", command=abrir_archivo)
boton_abrir.grid(row=0, column=2)

boton_editar = tk.Button(root, text="Editar", command=editar_archivo)
boton_editar.grid(row=0, column=3, padx=10, pady=5)

boton_editar = tk.Button(root, text="Preview", command=preview)
boton_editar.grid(row=0, column=4, padx=10, pady=5)

tk.Label(root, text="Archivo de Salida:").grid(row=1, column=0, sticky="w")
texto_archivo_salida = tk.Text(root, height=2, width=50)
texto_archivo_salida.grid(row=1, column=1)
boton_guardar = tk.Button(root, text="Guardar", command=guardar_archivo)
boton_guardar.grid(row=1, column=2)

boton_decodificar = tk.Button(root, text="Decodificar y Guardar", command=decodificar_y_guardar)
boton_decodificar.grid(row=2, column=1)


boton_salir = tk.Button(root,text = "Salir",command =salir)
boton_salir.grid(row=4, column=1)

mensaje_estado = tk.Label(root, text="", fg="green")
mensaje_estado.grid(row=3, column=0, columnspan=3)

# Iniciar la aplicación
root.mainloop()

# Para hacer las ventanas para ingresar a mano el ensamblador https://docs.hektorprofe.net/python/interfaces-graficas-con-tkinter/widget-button-boton/