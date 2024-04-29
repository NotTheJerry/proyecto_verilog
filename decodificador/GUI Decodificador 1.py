import tkinter as tk
from tkinter import filedialog

codigos_TipoR = {
    'add': {'op': '000000', 'funct': '100000'},  # ADD
    'sub': {'op': '000000', 'funct': '100010'},  # SUBstract
    'and': {'op': '000000', 'funct': '100100'},  # AND
    'or': {'op': '000000', 'funct': '100101'},   # OR
    'slt': {'op': '000000', 'funct': '101010'},  # SLT-set on less than
}

def decodificar_instrucciones(archivo_entrada, archivo_salida):
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
    archivo_entrada = filedialog.askopenfilename(filetypes=[("Archivos ASM", "*.asm")])
    if archivo_entrada:
        texto_archivo_entrada.delete(1.0, tk.END)
        texto_archivo_entrada.insert(1.0, archivo_entrada)

def guardar_archivo():
    archivo_salida = filedialog.asksaveasfilename(defaultextension=".txt")
    if archivo_salida:
        texto_archivo_salida.delete(1.0, tk.END)
        texto_archivo_salida.insert(1.0, archivo_salida)

def decodificar_y_guardar():
    archivo_entrada = texto_archivo_entrada.get(1.0, tk.END).strip()
    archivo_salida = texto_archivo_salida.get(1.0, tk.END).strip()
    if archivo_entrada and archivo_salida:
        decodificar_instrucciones(archivo_entrada, archivo_salida)
        mensaje_estado.config(text="Archivo decodificado y guardado correctamente.", fg="green")
    else:
        mensaje_estado.config(text="Por favor, SELECCIONE archivos de entrada y salida.", fg="red")

def salir():
    root.destroy()

# Crear la ventana principal
root = tk.Tk()
root.title("Decodificador de Instrucciones")

# Crear los elementos de la interfaz
tk.Label(root, text="Archivo de Entrada:").grid(row=0, column=0, sticky="w")
texto_archivo_entrada = tk.Text(root, height=2, width=50)
texto_archivo_entrada.grid(row=0, column=1)
boton_abrir = tk.Button(root, text="Abrir", command=abrir_archivo)
boton_abrir.grid(row=0, column=2)

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
