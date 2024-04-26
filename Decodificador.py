#Diccionario para los códigos de OP en MIPS, agregar los próximos códigos que se usarán hasta los 20
codigos_TipoR = {
        'add': {'op': '000000', 'funct': '100000'},  # ADD
        'sub': {'op': '000000', 'funct': '100010'},  # SUBstract
        'and': {'op': '000000', 'funct': '100100'},  # AND
        'or': {'op': '000000', 'funct': '100101'},   # OR
        'slt': {'op': '000000', 'funct': '101010'},  # SLT-set on less than
    }


def decodificar_instrucciones(archivo_entrada, archivo_salida):#Funcion que recibe el archivo de entrada y el archivo de salida
    #Abrir archivos de entrada y salida
    with open(archivo_entrada) as entrada, open(archivo_salida, 'w') as salida:
        # Leer línea por línea el archivo de entrada
        for linea in entrada: #Ciclo for que recorre cada linea del archivo .asm
            # Decodificar c/u 
            instruccion_binaria = decodificar_linea(linea, codigos_TipoR)
            #llama a la funcion que decodifica y guarda las instrucciones en esa variable
            salida.write(instruccion_binaria + '\n')
            # Escribir la instrucción en binario en el archivo de salida con salto de linea

    # Borrar el último salto de linea
    return archivo_salida

def decodificar_linea(linea, codigos_TipoR):
    # Dividir la línea en partes separadas por comas, cada registro y op
    partes = linea.split(',')
    # Obtener las partes de la instrucción por separado
    operacion = partes[0]
    # Se guarda lo que está antes de la primer coma, osea op
    registro_fuente1 = partes[1]
    # Se guarda lo que está antes de la segunda coma, osea fs
    registro_fuente2 = partes[2]
    # Se guarda lo que está antes de la tercer coma, osea ft
    registro_destino = partes[3]
    # Se guarda lo que está después de la tercer coma, osea fd

    # Buscar la información de op en el diccionario y funct
    informacion_operacion = codigos_TipoR[operacion]

    # Construir el código binario de la instrucción
    opcode = informacion_operacion['op']
    funct = informacion_operacion['funct']
    fs = f'{int(registro_fuente1):05b}' #Escribir los registros en 5 bits
    ft = f'{int(registro_fuente2):05b}'
    fd = f'{int(registro_destino):05b}'
    shamt = '0' * 5  # shamt es siempre cero y 5 bits

    # Instrucción completa
    codigo_binario = (opcode + fs + ft + fd + shamt + funct) #[-32:]

    return codigo_binario


decodificar_instrucciones("data.asm","data.txt")

def creararchivos (archivo_entrada, archivo_salida):
    
    return (archivo_entrada, archivo_salida)