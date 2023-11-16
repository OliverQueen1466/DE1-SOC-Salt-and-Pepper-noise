from PIL import Image

img = Image.open("noise.bmp")
img = img.convert("1")  # 转换为黑白图像
data = img.tobytes()    # 转换为二进制数据

with open("example.mif", "w") as f:
    f.write("DEPTH = %d;\n" % (len(data)*8))
    f.write("WIDTH = 1;\n")
    f.write("ADDRESS_RADIX = HEX;\n")
    f.write("DATA_RADIX = BIN;\n")
    f.write("CONTENT\n")
    f.write("BEGIN\n")
    for i in range(len(data)):
        for j in range(8):
            addr = i*8 + j
            value = (data[i] >> (7-j)) & 0x01
            f.write("%02X : %d;\n" % (addr, value))
    f.write("END;\n")