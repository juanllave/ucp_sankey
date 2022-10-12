links <- read.csv(text = "
                  source, target, value
                  Smith, Smith, 34949
                  Toews, Toews, 24831
                  Jean, Jean, 9301
                  Loewen, Loewen, 6496
                  Schulz, Schulz, 5835
                  Sawhney, Sawhney, 1787
                  Aheer, Aheer, 1394
                  Aheer, Smith, 32
                  Aheer, Toews, 539
                  Aheer, Jean, 653
                  Aheer, Loewen, 16
                  Aheer, Schulz, 345
                  Aheer, Sawhney, 459
                  Aheer, Lost, 116
                  Sawhney, Smith, 114
                  Sawhney, Toews, 539
                  Sawhney, Jean, 653
                  Sawhney, Loewen, 272
                  Sawhney, Schulz, 389
                  Sawhney, Lost, 279
                  Loewen, Smith, 3401
                  Loewen, Toews, 999
                  Loewen, Jean, 1094
                  Loewen, Schulz, 188
                  Loewen, Lost, 887
                  Schulz, Smith, 774
                  Schulz, Toews, 4202
                  Schulz, Jean, 952
                  Schulz, Lost, 1044
                  Jean, Smith, 3153
                  Jean, Toews, 5686
                  Jean, Lost, 336
                  ")

nodes <- data.frame(name = unique(c(as.character(links$source), as.character(links$target))))

links$source <- match(links$source, nodes$name) - 1
links$target <- match(links$target, nodes$name) - 1

library(networkD3)
sankeyNetwork(Links = links, Nodes = nodes, Source = "source", 
              Target = "target", Value = "value", NodeID = "name")