import tkinter as tk
from tkinter import filedialog
import subprocess

codigos_instrucciones = {
    # Instrucciones de movimiento de datos
    'lui': {'op': '001111'},
    'lb': {'op': '100000'},
    'lbu': {'op': '100100'},
    'sb': {'op': '101000'},
    'lh': {'op': '100001'},
    'lhu': {'op': '100101'},
    'sh': {'op': '101001'},
    'lw': {'op': '100011'},
    'sw': {'op': '101011'},
    'll': {'op': '110000'},
    'sc': {'op': '111000'},
    'movn': {'op': '001011'},

    # Instrucciones de movimiento de datos no alineado
    'lwl': {'op': '100010'},
    'lwr': {'op': '100110'},
    'swl': {'op': '101010'},
    'swr': {'op': '101110'},

    # Instrucciones aritméticas
    'add': {'op': '000000', 'funct': '100000'},
    'addi': {'op': '001000'},
    'addiu': {'op': '001001'},
    'addu': {'op': '000000', 'funct': '100001'},
    'sub': {'op': '000000', 'funct': '100010'},
    'subu': {'op': '000000', 'funct': '100011'},
    'mul': {'op': '011100', 'funct': '000010'},
    'mult': {'op': '000000', 'funct': '011000'},
    'multu': {'op': '000000', 'funct': '011001'},
    'madd': {'op': '000000', 'funct': '000000'},
    'maddu': {'op': '000000', 'funct': '000001'},
    'msub': {'op': '000000', 'funct': '000100'},
    'msubu': {'op': '000000', 'funct': '000101'},
    'div': {'op': '000000', 'funct': '011010'},
    'divu': {'op': '000000', 'funct': '011011'},

    # Instrucciones lógicas
    'and': {'op': '000000', 'funct': '100100'},
    'andi': {'op': '001100'},
    'or': {'op': '000000', 'funct': '100101'},
    'ori': {'op': '001101'},
    'nor': {'op': '000000', 'funct': '100111'},
    'xor': {'op': '000000', 'funct': '100110'},
    'xori': {'op': '001110'},

    # Instrucciones de desplazamiento
    'sll': {'op': '000000', 'funct': '000000'},
    'sllv': {'op': '000000', 'funct': '000100'},
    'srl': {'op': '000000', 'funct': '000010'},
    'srlv': {'op': '000000', 'funct': '000110'},
    'sra': {'op': '000000', 'funct': '000011'},
    'srav': {'op': '000000', 'funct': '000111'},

    # Instrucciones de comparación
    'slt': {'op': '000000', 'funct': '101010'},
    'slti': {'op': '001010'},
    'sltu': {'op': '000000', 'funct': '101011'},
    'sltiu': {'op': '001011'},

    # Instrucciones de salto
    'j': {'op': '000010'},
    'b': {'op': '000100'},
    'beq': {'op': '000100'},
    'bne': {'op': '000101'},
    'bnel': {'op': '010101'},
    'jal': {'op': '000011'}
}

def decodificar_instrucciones(archivo_entrada, archivo_salida):
    with open(archivo_entrada) as entrada, open(archivo_salida, 'w') as salida:
        for linea in entrada:
            instruccion_binaria = decodificar_linea(linea.strip(), codigos_instrucciones)
            salida.write(instruccion_binaria + '\n')
    return archivo_salida

def decodificar_linea(linea, codigos_instrucciones):
    partes = linea.split(',')
    operacion = partes[0]
    if operacion not in codigos_instrucciones:
        raise ValueError(f'Operación desconocida: {operacion}')

    informacion_operacion = codigos_instrucciones[operacion]

    opcode = informacion_operacion['op']
    if 'funct' in informacion_operacion:
        funct = informacion_operacion['funct']
    else:
        funct = '0' * 6
    if len(partes) == 4:  # Tipo R o I
        fs = f'{int(partes[1]):05b}'
        ft = f'{int(partes[2]):05b}'
        fd = f'{int(partes[3]):05b}'
        shamt = '0' * 5
        codigo_binario = (opcode + fs + ft + fd + shamt + funct)
    else:  # Tipo J
        address = f'{int(partes[1]):026b}'
        codigo_binario = (opcode + address)

    return codigo_binario

def abrir_archivo():
    archivo_entrada = filedialog.askopenfilename(filetypes=[("Archivos ASM", "*.asm")])
    if archivo_entrada:
        subprocess.Popen(['notepad.exe', archivo_entrada])  # Abre el archivo con el bloc de notas
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
        try:
            decodificar_instrucciones(archivo_entrada, archivo_salida)
            mensaje_estado.config(text="Archivo decodificado y guardado correctamente.", fg="green")
        except Exception as e:
            mensaje_estado.config(text=f"Error: {e}", fg="red")
    else:
        mensaje_estado.config(text="Por favor, SELECCIONE archivos de entrada y salida.", fg="red")

def salir():
    root.destroy()


root = tk.Tk()
root.title("Decodificador de Instrucciones")


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


root.mainloop()
