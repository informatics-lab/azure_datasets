from markdown import markdown
import sys
import argparse


parser = argparse.ArgumentParser(description='Convert markdown file to html.')
parser.add_argument('--title', dest='title', required=True,
                    help='title of the html document')
parser.add_argument('--markdown_file', dest='markdown_file', required=True,
                    help='file containing the mark down.')
parser.add_argument('--output_file', dest='output_file', required=True,
                    help='destination file for output html.')

args = parser.parse_args()


with open(args.markdown_file) as fp:
    md_txt = fp.read()

head = f"""
<html>
<head>
    <title>{args.title}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/4.0.0/github-markdown.min.css">
</head>
<body class="markdown-body">
"""
body = markdown(md_txt)
foot = "</body></html>"
html = (head+body+foot)

with open(args.output_file, 'w') as fp:
    fp.write(html)
