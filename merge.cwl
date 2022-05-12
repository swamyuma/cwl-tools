class: CommandLineTool
cwlVersion: v1.0

requirements:
  DockerRequirement:
    dockerPull: bedtools-image:latest
  ResourceRequirement:
    ramMax: 1000


inputs:
  sorted_bed:
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
