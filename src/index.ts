import 'dotenv/config';

import { syncPostsOnPinecone } from './pinecone.js';
import { fetchAllPosts } from './utils/unified.js';

export const main = async () => {
  /* const feed = await getPostsForYou("0xF6950C6090B9Fa0531Aac500b493c9CF175Ae701",'orbulo.eth');
  console.log(feed); */
  const posts = await fetchAllPosts();
  await syncPostsOnPinecone(
    posts
      .filter((p) => p.text && p.author_id && new Date(p.publish_date) >= new Date('2023-08-01'))
      .sort((a, b) => new Date(b.publish_date).getTime() - new Date(a.publish_date).getTime())
      .slice(50000)
  );
};

main().then(() => {
  process.exit(0);
});
