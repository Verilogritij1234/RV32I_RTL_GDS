import sys

def main():
    if len(sys.argv) != 3:
        print("Usage: python3 py_hex.py <input.bin> <output.hex>")
        sys.exit(1)

    input_bin = sys.argv[1]
    output_hex = sys.argv[2]
    depth = 16  # ROM depth

    try:
        with open(input_bin, "rb") as f_in, open(output_hex, "w") as f_out:
            data = f_in.read()
            words_written = 0
            
            for i in range(0, len(data), 4):
                word = data[i:i+4].ljust(4, b'\x00')
                val = int.from_bytes(word, byteorder='little')
                f_out.write(f"{val:08x}\n")
                words_written += 1

            # Pad remaining lines up to ROM depth with NOP (0x00000013)
            while words_written < depth:
                f_out.write("00000013\n")
                words_written += 1
                
        print(f"Successfully generated {output_hex} with {depth} entries.")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()