# Node TS Boilerplate by limone.eth

## pulse-rec-engine - ETHGlobal Istanbul

This repository serves powers the Pulse recommendation engine by:

- wrangling Farcaster data (indexed through https://github.com/gskril/farcaster-indexer) and Lens data (indexed through
  Lens's BigQuery tables and one query `lens-bigquery.sql`)
- generating embeddings for it with Cohere
- storing vectors on a Pinecone vector database

Once the vectors are on Pinecone, it is possible to query it for similarity searches.

The idea is that given an Ethereum address, we can fetch their onchain social graph (POAPs they collected,
casts/publications that they posted and more - all thanks to Airstack APIs), profile them and suggest them content that they might like, in a unique
feed merging Farcaster's and Lens's content. So, given an onchain social graph, we generate users' topics of interest
through OpenAI and then feed them to the similarity search query on Pinecone.


_** Posts are not yet being synchronized in realtime for the sake of the hackathon. Both Farcaster's and Lens's data are
a snapshot taken on Friday 17/11/2023 evening counting around 2.2M posts in total. Of all the posts, we had time to
generate embeddings and store them on Pinecone for only around 170k of them._
