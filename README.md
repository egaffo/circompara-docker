# Dockerized [CirComPara](http://github.com/egaffo/CirComPara)

[CirComPara](http://github.com/egaffo/CirComPara): A multi-method comparative bioinformatics pipeline to detect and study circRNAs from RNA-seq data.[^CirComPara]   

## Usage

Docker pull command:

	```bash
	docker pull egaffo/circompara-docker
	```

Run command example:
	
	```bash
	docker run --rm -it -v $(pwd):/data egaffo/circompara-docker
	```

# How to cite

If you used the docker image of CirComPara for your analysis, please add the following citation to your references:  
  
[^CirComPara]: Gaffo, E., Bonizzato, A., Kronnie, G. te & Bortoluzzi, S. CirComPara: A Multi‐Method Comparative Bioinformatics Pipeline to Detect and Study circRNAs from RNA‐seq Data. Non-Coding RNA 3, 8 (2017). [http://www.mdpi.com/2311-553X/3/1/8][circompara_article]


[circompara_article]: http://www.mdpi.com/2311-553X/3/1/8

