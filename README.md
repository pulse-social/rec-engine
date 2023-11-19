# Node TS Boilerplate by limone.eth

## pulse-rec-engine

This repository serves powers the Pulse recommendation engine by:

- wrangling Farcaster data (indexed through https://github.com/gskril/farcaster-indexer) and Lens data (indexed through
  Lens's BigQuery tables and one query `lens-bigquery.sql`)
- generating embeddings for it with Cohere
- storing vectors on a Pinecone vector database

Once the vectors are on Pinecone, it is possible to query it for similarity searches.

The idea is that given an Ethereum address, we can fetch their onchain social graph (POAPs they collected,
casts/publications that they posted and more), profile them and suggest them content that they might like, in a unique
feed merging Farcaster's and Lens's content.
