select
    publication_record.publication_id,publication_record.profile_id,publication_type,parent_publication_id,root_publication_id,is_hidden,publication_record.block_timestamp,
    content,language,main_content_focus,tags_vector, profile_metadata.name as profile_name, profile_record.owned_by, profile_metadata.metadata_snapshot_location_url as profile_metadata_url, namespace_handle.local_name as handle
from lens-public-data.v2_polygon.publication_record
    inner join lens-public-data.v2_polygon.publication_metadata on publication_record.publication_id = publication_metadata.publication_id
    inner join lens-public-data.v2_polygon.profile_metadata on publication_record.profile_id = profile_metadata.profile_id
    inner join lens-public-data.v2_polygon.profile_record on publication_record.profile_id = profile_record.profile_id
    inner join lens-public-data.v2_polygon.namespace_handle_link on profile_record.profile_id = namespace_handle_link.token_id
    inner join lens-public-data.v2_polygon.namespace_handle on namespace_handle_link.handle_id = namespace_handle.handle_id
where LENGTH(content) > 20 AND language = "en" AND main_content_focus = "TEXT_ONLY" AND publication_type = "POST"