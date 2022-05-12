class: CommandLineTool
cwlVersion: v1.0

label: Merge input files which have been sorted

requirements:
  DockerRequirement:
    dockerPull: bedtools-image:latest
  ResourceRequirement:
    ramMax: 1000


inputs:
  sorted_bed:
    label: Inpout sorted bed file
    type: File
    inputBinding:
      prefix: -i

  operation:
    type:
      type: enum
      symbols:
        - distinct
        - collapse
        - count
    default: distinct
    inputBinding:
      prefix: -o

  output_fn:
    label: Merged output file name
    type: string
    default: sorted.bed

outputs:
  merged_bed:
    type: stdout

stdout: $(inputs.output_fn)

baseCommand: ["bedtools", "merge"]

arguments:
  - prefix: -c
    valueFrom: "4"
