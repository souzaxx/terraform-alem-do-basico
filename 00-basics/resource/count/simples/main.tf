resource "local_file" "count" {
  count = 4

  filename = "./arquivo_${count.index}"
  content = "Esse é o file ${count.index}"
}

# Count é utilizado para replicar o mesmo bloquinho de resource N vezes.

// resource "local_file" "count0" {
//   filename = "./arquivo_0"
//   content = "Esse é o arquivo 0"
// }

// resource "local_file" "count1" {
//   filename = "./arquivo_1"
//   content = "Esse é o arquivo 1"
// }
