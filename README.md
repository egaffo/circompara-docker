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

Mind that all files must be in the current directory and that paths in `meta.csv` and `vars.py` must be relative to the container `/data` directory. For instance, using the test data, you have to copy the `annotation` and `reads` directories into the `analysis` directory. Then, `meta.csv` will be as follows:  

    file,sample,condition,adapter  
    /data/reads/readsA_1.fastq.gz,sample_A,A,/CirComPara/tools/Trimmomatic-0.36/adapters/TruSeq3-PE-2.fa  
    /data/reads/readsA_2.fastq.gz,sample_A,A,/CirComPara/tools/Trimmomatic-0.36/adapters/TruSeq3-PE-2.fa  
    /data/reads/readsB_1.fastq.gz,sample_B,B,/CirComPara/tools/Trimmomatic-0.36/adapters/TruSeq3-PE-2.fa  
    /data/reads/readsB_2.fastq.gz,sample_B,B,/CirComPara/tools/Trimmomatic-0.36/adapters/TruSeq3-PE-2.fa  

and `vars.py`:  

```python
META            = "meta.csv"
GENOME_FASTA    = '/data/annotation/CFLAR_HIPK3.fa'
ANNOTATION      = '/data/annotation/CFLAR_HIPK3.gtf' 
```

The results will be owned by `root`. If you want the container to give your user permissions try to use the "-u `id -u`" workaround:

```bash
docker run -u `id -u` --rm -it -v $(pwd):/data egaffo/circompara-docker
```

# How to cite

If you used the docker image of CirComPara for your analysis, please add the following citation to your references:  
  
[^CirComPara]: Gaffo, E., Bonizzato, A., Kronnie, G. te & Bortoluzzi, S. CirComPara: A Multi‐Method Comparative Bioinformatics Pipeline to Detect and Study circRNAs from RNA‐seq Data. Non-Coding RNA 3, 8 (2017). [http://www.mdpi.com/2311-553X/3/1/8][circompara_article]


[circompara_article]: http://www.mdpi.com/2311-553X/3/1/8

