<?php

namespace Drupal\lupus_decoupled_drupal_example\Plugin\Block;

use Drupal\Core\Block\BlockBase;
use Drupal\custom_elements\CustomElement;

/**
 * Provides an example news listing block.
 *
 * @Block(
 *   id = "lupus_decoupled_drupal_example_news_listing",
 *   admin_label = @Translation("Example news listing"),
 *   category = @Translation("Custom")
 * )
 */
class ExampleNewsListingBlock extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $articles[] = CustomElement::create('article-teaser')
      ->setAttribute('href', 'https://example.com/news/1')
      ->setAttribute('excerpt', 'The excerpt of the news entry.');
    $articles[] = CustomElement::create('article-teaser')
      ->setAttribute('href', 'https://example.com/news/2')
      ->setAttribute('excerpt', 'The excerpt of another news entry.');

    $teaser_listing = CustomElement::create('teaser-listing')
      ->setAttribute('title', 'Latest news')
      ->setAttribute('icon', 'news')
      ->setSlotFromNestedElements('default', $articles);

    // We need to return a render-array here. CE-rendering
    // will know how to handle it.
    return $teaser_listing->toRenderArray();
  }

}
